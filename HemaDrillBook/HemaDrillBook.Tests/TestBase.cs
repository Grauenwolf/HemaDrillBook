using HemaDrillBook.Services;
using Microsoft.Extensions.Configuration;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Linq;
using System.Threading.Tasks;
using Tortuga.Chain;

namespace HemaDrillBook.Tests
{
    public abstract class TestBase
    {
        protected static SqlServerDataSource DataSource { get; set; }

        static TestBase()
        {
            var configuration = new ConfigurationBuilder().SetBasePath(AppContext.BaseDirectory).AddJsonFile("appsettings.json").Build();

            var connectionString = configuration.GetSection("ConnectionStrings").GetChildren().First().Value;

            DataSource = new SqlServerDataSource(connectionString);
        }
    }
}
