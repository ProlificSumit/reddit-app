package org.baeldung.web.controller.rest;

import java.util.List;

import org.baeldung.persistence.service.IRedditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/api")
public class RedditRestController {

    @Autowired
    private IRedditService service;

    // === API Methods

    @RequestMapping(value = "/subredditAutoComplete")
    @ResponseBody
    public List<String> subredditAutoComplete(@RequestParam("term") final String term) {
        return service.searchSubreddit(term);
    }

}
