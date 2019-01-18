using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Nerve.Repository
{
    public class ScpDbContext: DbContext
    {
        private readonly string _connectionString;
        public ScpDbContext(DbContextOptions<ScpDbContext> options): base(options)
        {
            
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
        }
    }
}
