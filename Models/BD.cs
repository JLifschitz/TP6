using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
static class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=Elecciones2023; Trusted_Connection=True;";
    public static void AgregarCandidato(Candidato can)
    {
        string sql = "Insert into Candidatos(IdPartido, Apellido, Nombre, FechaNacimiento, Foto, Postulacion) Values (@IdPartido, @Apellido, @Nombre, @FechaNacimiento, @Foto, @Postulacion)";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, can);
        }
    }
        public static void EliminarCandidato(int id)
    {
        string sql = "Delete From Candidatos Where IdCandidato = @pid";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new{pid = id});
        }
    }

    public static Partido VerInfoPartido(int id)
    {
        Partido devolver = null;
        string sql = "Select * From Partidos Where IdPartido = @pid";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.QueryFirstOrDefault<Partido>(sql, new{pid = id});
        }
        return devolver;
    }

    public static Candidato VerInfoCandidato(int id)
    {
        Candidato devolver = null;
        string sql = "Select * From Candidatos Where IdCandidato = @pid";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.QueryFirstOrDefault<Candidato>(sql, new{pid = id});
        }
        return devolver;
    }

       public static List<Partido> ListarPartidos()
    {
        List<Partido> devolver = new List<Partido>();
        string sql = "Select * From Partidos Order by Nombre";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.Query<Partido>(sql).ToList();
        }
        return devolver;
    }

        public static List<Candidato> ListarCandidatos(int partido)
    {
        List<Candidato> devolver =  new List<Candidato>();
        string sql = "Select * From Candidatos where IdPartido = @ipartido Order by Nombre";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            devolver = db.Query<Candidato>(sql, new {ipartido = partido}).ToList();
        }
        return devolver;
    }
}