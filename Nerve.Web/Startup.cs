using Autofac;
using Autofac.Extensions.DependencyInjection;
using AutoMapper;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Nerve.Web.Translation;
using NetCore.AutoRegisterDi;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;

namespace Nerve.Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IContainer ApplicationContainer { get; private set; }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public IServiceProvider ConfigureServices(IServiceCollection services)
        {
            //services.Configure<CookiePolicyOptions>(options =>
            //{
            //    // This lambda determines whether user consent for non-essential cookies is needed for a given request.
            //    options.CheckConsentNeeded = context => true;
            //    options.MinimumSameSitePolicy = SameSiteMode.None;
            //});

            services.Configure<Repository.AppSettings>(Configuration.GetSection("ApplicationSettings"));
            services.AddMvc();
            services.AddDistributedMemoryCache(); // Adds a default in-memory implementation of IDistributedCache
            services.AddSession(state =>
            {
                state.IdleTimeout = TimeSpan.FromMinutes(20);
            });

            // create a Autofac container builder
            var builder = new ContainerBuilder();

            // read service collection to Autofac
            builder.Populate(services);

            var currentAssembly = Assembly.GetExecutingAssembly();

            // Set the dependency resolver to be Autofac.
            builder.RegisterType<Mapper>().As<IMapper>();
            builder.RegisterType<LanguageTranslator>().As<ILanguageTranslator>();

            // Register referenced assemblies for included in web api
            var assemblies = Assembly.GetExecutingAssembly().GetReferencedAssemblies().Where(x => x.Name.StartsWith("Nerve.")).ToList();
            var repositoryAssemblies = assemblies.Where(x => x.FullName.Contains("Nerve.Repository")).ToArray();
            var serviceAssemblies = assemblies.Where(x => x.FullName.Contains("Nerve.Service")).ToArray();

            // Register services
            if (serviceAssemblies.Length > 0)
            {
                var serviceAssembly = Assembly.Load(serviceAssemblies[0]);
                RegisterServices(builder, serviceAssembly);
            }

            // Register repositories
            if (repositoryAssemblies.Length > 0)
            {
                var repositoryAssembly = Assembly.Load(repositoryAssemblies[0]);
                RegisterRepository(builder, repositoryAssembly);
            }


            // Register auto mapper
            RegisterAutoMapper(builder);

            // Register current web api assembly
            builder.RegisterAssemblyModules(currentAssembly);


            // build the Autofac container
            ApplicationContainer = builder.Build();

            // creating the IServiceProvider out of the Autofac container
            return new AutofacServiceProvider(ApplicationContainer);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            // app.UseHttpsRedirection();
            app.UseSession();
            app.UseStaticFiles();
            //app.UseCookiePolicy();
            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Users}/{action=Login}/{id?}");
            });
        }

        private static void RegisterCommons(ContainerBuilder builder, Assembly assembly)
        {
            builder.RegisterAssemblyModules(assembly);
        }

        private static void RegisterServices(ContainerBuilder builder, Assembly assembly)
        {
            builder.RegisterAssemblyModules(assembly);
            builder.RegisterAssemblyTypes(assembly).Where(x => x.Name.EndsWith("Service"))
                .AsImplementedInterfaces();
        }

        private static void RegisterRepository(ContainerBuilder builder, Assembly repositoryAssembly)
        {
            builder.RegisterAssemblyModules(repositoryAssembly);
            //builder.RegisterType<GGLContext>()
            //    .As<GGLContext>()
            //    .InstancePerLifetimeScope();

            builder.RegisterAssemblyTypes(repositoryAssembly).AssignableTo(typeof(Profile)).As<Profile>();
            builder.RegisterAssemblyTypes(repositoryAssembly).Where(x => x.Name.EndsWith("Repository"))
                .AsImplementedInterfaces();
        }

        private static void RegisterAutoMapper(ContainerBuilder builder)
        {
            builder.RegisterAssemblyTypes().AssignableTo(typeof(Profile)).As<Profile>();

            //register your configuration as a single instance
            builder.Register(c => new MapperConfiguration(cfg =>
            {
                //add your profiles (either resolve from container or however else you acquire them)
                foreach (var profile in c.Resolve<IEnumerable<Profile>>())
                {
                    cfg.AddProfile(profile);
                }
            })).AsSelf().SingleInstance();

            //register your mapper
            builder.Register(c => c.Resolve<MapperConfiguration>()
                                                                .CreateMapper(c.Resolve))
                                                                .As<IMapper>()
                                                                .InstancePerLifetimeScope();

        }

        //private static void EnableCorsRequest(HttpConfiguration config)
        //{
        //    var enableCorsUrl = ConfigurationManager.AppSettings["EnableCorsRequestUrl"];
        //    var cors = new EnableCorsAttribute(enableCorsUrl, "*", "*");
        //    config.EnableCors(cors);
        //}
    }
}
