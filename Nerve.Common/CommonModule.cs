using Autofac;
using Nerve.Common.Helpers;

namespace Nerve.Common
{
    public class CommonModule: Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<Logger>().As<ILogger>().SingleInstance();
            builder.RegisterType(typeof(DynamicSqlBuilderHelper)).AsImplementedInterfaces();
            base.Load(builder);
        }
    }
}
