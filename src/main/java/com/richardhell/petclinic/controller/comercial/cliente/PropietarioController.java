/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.richardhell.petclinic.controller.comercial.cliente;

import com.richardhell.petclinic.dao.PersonaDAO;
import com.richardhell.petclinic.dao.PropietarioDAO;
import com.richardhell.petclinic.model.Persona;
import com.richardhell.petclinic.model.Propietario;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author mcondori
 */
@Controller
@Transactional
@RequestMapping("com/propietario")
public class PropietarioController {
    
    @Autowired
    PropietarioDAO propietarioDAO;

    @Autowired
    PersonaDAO personaDAO;
    
    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("propietarios", propietarioDAO.all());
        return "comercial/cliente/propietario";
    }
    
    @RequestMapping("new")
    public String create(Model model) {
        model.addAttribute("propietario", new Propietario());
        model.addAttribute("persona", new Persona());
        return "comercial/cliente/propietarioForm";
    }
    
    @RequestMapping("update/{id}")
    public String update(@PathVariable("id") Long id, Model model) {
        Propietario pro = propietarioDAO.find(new Propietario(id));
        model.addAttribute("propietario", pro);
        model.addAttribute("persona", pro.getPersona());
        return "comercial/cliente/propietarioForm";
    }

    @RequestMapping("save")
    public String save(Propietario pro) {
        
        if (pro.getId() == null) {
            Persona persona = pro.getPersona();
            personaDAO.saveDAO(persona);

            pro.setFechaRegistro(new Date());
            propietarioDAO.saveDAO(pro);
        } else {
            
            Persona persona = pro.getPersona();
            personaDAO.updateDAO(persona);

        }
        return "redirect:/com/propietario";
    }

    @RequestMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        propietarioDAO.deleteDAO(new Propietario(id));
        return "redirect:/com/propietario";
    }
    @ExceptionHandler(Exception.class)
    public String handleConflict() {
        return "redirect:/com/propietario";
    }
}
