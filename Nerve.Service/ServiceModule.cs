using Autofac;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace Nerve.Service
{
    public class ServiceModule : Autofac.Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterAssemblyTypes(Assembly.GetExecutingAssembly())
           .Where(t => t.Name.EndsWith("Service"))
           .AsImplementedInterfaces()
           .InstancePerRequest();

            base.Load(builder);
        }
    }
}
