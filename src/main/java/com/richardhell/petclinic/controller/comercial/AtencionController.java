/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.richardhell.petclinic.controller.comercial;

import com.richardhell.petclinic.dao.MascotaDAO;
import com.richardhell.petclinic.dao.VeterinarioDAO;
import com.richardhell.petclinic.dao.VisitaDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author mcondori
 */
@Controller
@Transactional
@RequestMapping("com/atencion")
public class AtencionController {
    @Autowired
    VisitaDAO visitaDAO;

    @Autowired
    MascotaDAO mascotaDAO;
    
    @Autowired
    VeterinarioDAO veterinarioDAO;
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("propietarios", visitaDAO.all());
        return "comercial/cliente/propietario";
    }
}
