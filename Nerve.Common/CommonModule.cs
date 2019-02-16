using Autofac;
using Nerve.Common.Helpers;
using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Common
{
    public class CommonModule: Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<Logger>().As<ILogger>();
            builder.RegisterType(typeof(DynamicSqlBuilderHelper)).AsImplementedInterfaces();
            base.Load(builder);
        }
    }
}
