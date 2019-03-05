using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Autofac;
using AutoMapper;

namespace Nerve.Web
{
    public class WebModule : Autofac.Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterAssemblyTypes(ThisAssembly)
               .Where(t => t.Name.EndsWith("Controller"))
               .AsSelf()
               .InstancePerLifetimeScope();
            builder.RegisterAssemblyTypes(ThisAssembly).AssignableTo(typeof(Profile)).As<Profile>();
            base.Load(builder);
        }
    }
}
