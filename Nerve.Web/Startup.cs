using Autofac;
using Autofac.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Nerve.Repository;
using Nerve.Service;
using System;
using System.Reflection;
using System.Linq;

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
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });


            services.AddMvc()
                .SetCompatibilityVersion(CompatibilityVersion.Version_2_1)
                .AddControllersAsServices();

            // create a Autofac container builder
            var builder = new ContainerBuilder();

            

            // read service collection to Autofac
            builder.Populate(services);

            // register repository
            builder.RegisterModule(new RepositoryModule());

            // register service 
            builder.RegisterModule(new ServiceModule());

            var refrencedAssemblies = Assembly.GetExecutingAssembly().GetReferencedAssemblies();

            if (refrencedAssemblies != null && refrencedAssemblies.Length > 0)
            {
                var repositoryAssembly = refrencedAssemblies.Where(x => x.Name.Contains("Nerve.Repository")).ToArray();
                if (repositoryAssembly.Any())
                {
                    builder.RegisterAssemblyModules().Where(t => t.Name.EndsWith("Repository"))
                    .AsImplementedInterfaces()
                    .InstancePerRequest();
                }

                //var serviceAssembly = refrencedAssemblies.Where(x => x.Name.Contains("Nerve.Service")).Cast<Assembly>().ToArray();
                //if (serviceAssembly.Any())
                //{
                //    builder.RegisterAssemblyTypes(serviceAssembly).Where(t => t.Name.EndsWith("Service"))
                //    .AsImplementedInterfaces()
                //    .InstancePerRequest();
                //}
            }


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
            app.UseStaticFiles();
            app.UseCookiePolicy();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Users}/{action=Login}/{id?}");
            });
        }
    }
}
