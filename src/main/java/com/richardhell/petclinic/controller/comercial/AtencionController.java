/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.richardhell.petclinic.controller.comercial;

import com.richardhell.petclinic.dao.MascotaDAO;
import com.richardhell.petclinic.dao.VeterinarioDAO;
import com.richardhell.petclinic.dao.VisitaDAO;
import com.richardhell.petclinic.model.Mascota;
import com.richardhell.petclinic.model.Visita;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author mcondori
 */
@Controller
@Transactional
@SessionAttributes("visita")
@RequestMapping("com/atencion")
public class AtencionController {
    @Autowired
    VisitaDAO visitaDAO;

    @Autowired
    MascotaDAO mascotaDAO;
    
    @Autowired
    VeterinarioDAO veterinarioDAO;
    
    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("visitas", visitaDAO.all());
        return "comercial/atencion";
    }
    
    @RequestMapping("new")
    public String create(Model model) {
        model.addAttribute("visita", new Visita());
        model.addAttribute("veterinarios", veterinarioDAO.all());
        model.addAttribute("mascotas", mascotaDAO.all());
        return "comercial/atencionForm";
    }
    @RequestMapping("update/{id}")
    public String update(@PathVariable("id") Long id, Model model) {
        Visita visita = visitaDAO.find(new Visita(id));
        model.addAttribute("visita", visita);
        model.addAttribute("veterinarios", veterinarioDAO.all());
        model.addAttribute("mascotas", mascotaDAO.all());
        return "comercial/atencionForm";
    }
    @RequestMapping("save")
    public String save(Visita vis) {

        if (vis.getId() == null) {
            visitaDAO.saveDAO(vis);
        } else {
            visitaDAO.updateDAO(vis);
        }
        return "redirect:/com/atencion";
    }
    
    @RequestMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id) {

        visitaDAO.deleteDAO(new Visita(id));
        return "redirect:/com/atencion";
    }
    
    @ExceptionHandler(Exception.class)
    public String handleConflict() {
        return "redirect:/com/propietario";
    }

    
}
