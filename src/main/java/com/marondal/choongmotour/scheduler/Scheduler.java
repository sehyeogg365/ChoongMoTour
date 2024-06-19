package com.marondal.choongmotour.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {

    @Autowired
    private AutomaticDeletionService deletionService;


    // 2024-05-16 예약 30일 지난 숙소는 자동삭제

    //@Scheduled(cron = "0 30 04 * * *")


}
