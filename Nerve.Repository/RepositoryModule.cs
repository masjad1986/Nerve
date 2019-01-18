using Autofac;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace Nerve.Repository
{
    public class RepositoryModule : Autofac.Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterAssemblyTypes(Assembly.GetExecutingAssembly())
           .Where(t => t.Name.EndsWith("Repository"))
           .AsImplementedInterfaces()
           .InstancePerRequest();

            base.Load(builder);
        }
    }
}
