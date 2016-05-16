using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using HRModule;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


// DB QUERY
// dbSqlCommand.CommandText = "SELECT EMP_NO, EMP_NAME, EMP_NAME_P, EMP_DES from ESUPPORTV_HR_EMP_DATA_FINAL WHERE (EMP_NAME LIKE UPPER('%" + SearchText + "%') OR EMP_NAME_P LIKE UPPER('%" + SearchText + "%') OR EMP_DES LIKE UPPER('%" + SearchText + "%')) AND EMP_EXIST = 'Y' ORDER BY EMP_NO";

// GRID SEARCH MATCHING & HIGHLIGHTING WITHOUT USING MATCHEVALUATOR

public partial class TestProj_GridSearchMatch : System.Web.UI.Page
{
    TestProjClass objTest = new TestProjClass();
        
    // CREATE A STRING TO STORE OUR SEARCH RESULTS
    string SearchString = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadgvDetails();
    }

    // LOAD GVDETAILS GRIDVIEW
    private void LoadgvDetails()
    {       
        SearchString = txtSearch.Text;
        gvDetails.DataSource = objTest.GetEmployeeList(SearchString);
        gvDetails.DataBind();
    }

    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        //  SET THE VALUE OF THE SEARCHSTRING SO IT GETS
        SearchString = txtSearch.Text;
        LoadgvDetails();
    }

    protected void btnClear_Click(object sender, ImageClickEventArgs e)
    {
        //  SIMPLE CLEAN UP TEXT TO RETURN THE GRIDVIEW TO IT'S DEFAULT STATE
        txtSearch.Text = "";
        SearchString = "";
        LoadgvDetails();
    }

    public string HighlightText(string MainText)
    {
        
        //string SearchText = txtSearch.Text;

        // SETUP THE REGULAR EXPRESSION AND ADD THE OR OPERATOR.
        Regex RegExp = new Regex(SearchString.Replace(" ", "|").Trim(), RegexOptions.IgnoreCase);

        // REPLACE METHOD ON REGEXP
        return RegExp.Replace(MainText, Test(MainText, SearchString, RegExp));

    }

    protected string Test(string MainText, string SearchString, Regex RegExp)
    {
        string result = "";
        // INSTANTIATING MATCH OBJECT THAT MATCHES SEARCHSTRING & MAINTEXT & GETS THE RESULT
        Match m = RegExp.Match(MainText);
        // WHEN MATCH SUCCESSFUL
        while (m.Success)
        {
            // HIGHLIGHT THE RESULTING MATCHED TEXT
            result = "<span class=highlight>" + m.Value + "</span>";
            m = m.NextMatch();
        }
        return result;
    }

}