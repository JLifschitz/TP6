using Microsoft.AspNetCore.Mvc;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        ViewBag.listPartidos = BD.ListarPartidos();
        return View();
    }

    public IActionResult VerDetallePartido(int id)
    {
        ViewBag.partido = BD.VerInfoPartido(id);
        ViewBag.listCandidatos = BD.ListarCandidatos(id);
        return View();
    }

    public IActionResult VerDetalleCandidato(int id)
    {
        ViewBag.candidato = BD.VerInfoCandidato(id);
        return View();  
    }

    public IActionResult AgregarCandidato(int id)
    {
        ViewBag.idPartido = id;
        return View();
    }

     [HttpPost] public IActionResult GuardarCandidato(Candidato can)
    {
        BD.AgregarCandidato(can);
        return RedirectToAction("VerDetallePartido", new{id = can.IdPartido});
    }

    public IActionResult EliminarCandidato(int idCandidato, int idPartido)
    {
        BD.EliminarCandidato(idCandidato);
        return RedirectToAction("VerDetallePartido");
    }

    public IActionResult Elecciones()
    {
        return View();
    }

    public IActionResult Creditos()
    {
        return View();
    }
}
