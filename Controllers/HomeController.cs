using Microsoft.AspNetCore.Mvc;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        ViewBag.listPartidos = BD.ListarPartidos();
        return View();
    }

    IActionResult VerDetallePartido(int idPartido)
    {
        ViewBag.partido = BD.VerInfoPartido(idPartido);
        ViewBag.Candidatos = BD.ListarCandidatos(idPartido);
        return View("DetallePartido");
    }

    IActionResult VerDetalleCandidato(int IdCandidato)
    {
        ViewBag.Candidato = BD.VerInfoCandidato(IdCandidato);
        return View();
    }

    IActionResult AgregarCandidato(int IdPartido)
    {
        ViewBag.Partido = IdPartido;
        return View();
    }

    [HttpPost] IActionResult GuardarCandidato(Candidato can)
    {
        BD.AgregarCandidato(can);
        return RedirectToAction("VerDetallePartido");
    }

    IActionResult EliminarCandidato(int idCandidato, int idPartido)
    {
        BD.EliminarCandidato(idCandidato);
        return RedirectToAction("VerDetallePartido");
    }

    IActionResult Elecciones()
    {
        return View();
    }

    IActionResult Creditos()
    {
        return View();
    }
}
