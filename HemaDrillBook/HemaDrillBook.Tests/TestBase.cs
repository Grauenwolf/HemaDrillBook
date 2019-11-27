using Microsoft.Extensions.Configuration;
using System;
using System.Linq;
using Tortuga.Chain;
using Tortuga.Chain.SqlServer;

namespace HemaDrillBook.Tests
{
    public abstract class TestBase
    {
        protected static SqlServerDataSource DataSource { get; set; }

        static TestBase()
        {
            var configuration = new ConfigurationBuilder().SetBasePath(AppContext.BaseDirectory).AddJsonFile("appsettings.json").Build();

            var connectionString = configuration.GetSection("ConnectionStrings").GetChildren().First().Value;

            DataSource = new SqlServerDataSource(connectionString)
                .WithSettings(new SqlServerDataSourceSettings() { StrictMode = true });
        }
    }
}
