package com.marondal.choongmotour.scheduler;

import com.marondal.choongmotour.lodging.dao.LodgingDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AutomaticDeletionServiceImpl implements AutomaticDeletionService{

    @Autowired
    private LodgingDAO loadingDAO;

    /*
    @Override
    public void deleteLodging(){



    }*/
}
