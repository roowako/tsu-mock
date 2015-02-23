<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
        Application.Lock()
        Application("logged_user") = 0
        Application.UnLock()
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
        Application.Lock()
        Application("logged_user") = Integer.Parse(Application("logged_user")) + 1
        
        Application.UnLock()
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("Default.aspx")       
    End Sub
    
    Protected Sub Page_Init(sender As Object, e As EventArgs)
        If Context.Session IsNot Nothing Then
            If Session.IsNewSession Then
                Dim newSessionIdCookie As HttpCookie = Request.Cookies("id")
                If newSessionIdCookie IsNot Nothing Then
                    Dim newSessionIdCookieValue As String = newSessionIdCookie.Value
                    If newSessionIdCookieValue <> String.Empty Then
                        ' This means Session was timed Out and New Session was started
                        Response.Redirect("Default.aspx")
                    End If
                End If
            End If
        End If
    End Sub
       
</script>