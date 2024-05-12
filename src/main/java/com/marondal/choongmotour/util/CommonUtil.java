package com.marondal.choongmotour.util;

import com.marondal.choongmotour.lodging.model.PagingDTO;

public class CommonUtil {


    public static PagingDTO calculatePaging(int countPage, int currPage, int size, int totalData) {

//		int totalPage = (totalData -1) / size;
////		logger.info("totalPage0 : " + totalPage);
//		if (totalPage % countPage >= 0) {
//			totalPage++;
//		}

        int totalPage = (totalData / size) + ( (totalData % size) > 0 ? 1 : 0 );
        int lastLink = (int)Math.ceil((double)currPage / countPage) * countPage;
        int firstPage = lastLink - (countPage - 1);
        int lastPage = Math.min(lastLink, totalPage);

//		logger.info("totalPage : " + totalPage);
//		logger.info("totalData : " + totalData);
//		logger.info("countPage : " + countPage);
//		logger.info("currPage : " + currPage);
//		logger.info("lastLink : " + lastLink);
//		logger.info("firstPage : " + firstPage);
//		logger.info("lastPage : " + lastPage);

        return new PagingDTO(currPage, totalPage, firstPage, lastPage, totalData);
    }
}
