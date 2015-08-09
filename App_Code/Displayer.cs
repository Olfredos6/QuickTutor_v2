using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Displayer
/// </summary>
public class Displayer
{
    string conString;
    public SqlConnection conObject;

	public Displayer()
	{
        conString = @"Data Source = .\sqlExpress; Initial Catalog = QuickTutor; Integrated Security = True";
        conObject = new SqlConnection(conString);
	}


    public int TotalSubject() {
        //This method return the total number of known subject
        string qrySel = "select count(*) from Subjects";
        SqlCommand cmdObject = new SqlCommand(qrySel, conObject);
        conObject.Open();
        int totalSubject = Convert.ToInt32(cmdObject.ExecuteScalar());
        conObject.Close();

        return totalSubject;
    }
    public int TotalTutoring() {
        //This method return the total number of token which determine the number of
        //time a tutor helped a student.
        string qrySel = "select count(*) from TokenSpace";
        SqlCommand cmdObject = new SqlCommand(qrySel, conObject);
        conObject.Open();
        int totalTutoring = Convert.ToInt32(cmdObject.ExecuteScalar());
        conObject.Close();

        return totalTutoring;
    }
    public int TotalTutor() {
        //This method return the total number of tutor
        string qrySel = "select count(*) from Tutors";
        SqlCommand cmdObject = new SqlCommand(qrySel, conObject);
        conObject.Open();
        int totalTutor = Convert.ToInt32(cmdObject.ExecuteScalar());
        conObject.Close();

        return totalTutor;
    }

    public void TutorOfTheMonth(out string pseudo, out string subject, out int credit) {
        //This method return the tutor database row with the highest credit number 
        string qrySel = "select * from Subjects where Credit = (Select MAX(Credit) from Subjects)";
        SqlCommand cmdObject = new SqlCommand(qrySel, conObject);
        conObject.Open();
        SqlDataReader readMaxCredit = cmdObject.ExecuteReader();
        readMaxCredit.Read();
        pseudo = readMaxCredit["Pseudo"].ToString();
        subject = readMaxCredit["Name"].ToString();
        credit = Convert.ToInt32(readMaxCredit["Credit"]);
        conObject.Close();

        //return readMaxCredit;
    }

}