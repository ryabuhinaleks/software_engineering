using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Сводное описание для WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Чтобы разрешить вызывать веб-службу из скрипта с помощью ASP.NET AJAX, раскомментируйте следующую строку. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

    }


    [WebMethod]
    public List<string> GetTable(string table)
    {
        String Connect = "server=127.0.0.1;user id=root;database=laba_2";
        MySqlConnection con = new MySqlConnection(Connect);
        con.Open();
        string query = "select * from " + table + " ";

        MySqlCommand command = new MySqlCommand(query, con);
        MySqlDataReader reader = command.ExecuteReader();

        List<string> list_str = new List<string>();

        while (reader.Read())
        {
            string str = reader.GetName(1) + ": "+reader.GetString(1) + ",  "+reader.GetName(2)+": "+ reader.GetString(2);
            list_str.Add(str);
        }
        con.Close();
        return list_str;
    }

    [WebMethod]
    public string AddTable(string table ,string param1, string param2)
    {
        String Connect = "server=127.0.0.1;user id=root;database=laba_2";
        MySqlConnection con = new MySqlConnection(Connect);
        con.Open();
        string query = "INSERT INTO "+ table + "  VALUES (NULL, '"+ param1 + "', '"+ param2 + "');";
        MySqlCommand command = new MySqlCommand(query, con);
        command.ExecuteReader();
        con.Close();
        return "Данные добавлены.";
    }

    [WebMethod]
    public string UpdateTable(string table, string param1, string param2, string id)
    {
        String Connect = "server=127.0.0.1;user id=root;database=laba_2";
        MySqlConnection con = new MySqlConnection(Connect);
        con.Open();
        string query = "";
        if (table == "services")
        {
            query = "UPDATE " + table + " SET name='" + param1 + "', price='" + param2 + "' WHERE id=" + id + "";
        }
        else
        {
            query = "UPDATE " + table + " SET name='" + param1 + "', data='" + param2 + "' WHERE id=" + id + "";
        }
        MySqlCommand command = new MySqlCommand(query, con);
        command.ExecuteReader();
        con.Close();
        return "Данные Обновлены.";
    }


    [WebMethod]
    public string DeleteTable(string table,  string id)
    {
        String Connect = "server=127.0.0.1;user id=root;database=laba_2";
        MySqlConnection con = new MySqlConnection(Connect);
        con.Open();
        string query = "DELETE FROM "+ table + " WHERE id=" + id + "";
        MySqlCommand command = new MySqlCommand(query, con);
        command.ExecuteReader();
        con.Close();
        return "Данные Удалены.";
    }

}
