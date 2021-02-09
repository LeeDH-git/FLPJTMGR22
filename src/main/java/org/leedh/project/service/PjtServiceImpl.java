package org.leedh.project.service;


import lombok.extern.slf4j.Slf4j;
import org.leedh.project.dao.PjtDao;
import org.leedh.user.vo.EmpVO;
import org.leedh.project.vo.PjtVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.rmi.runtime.Log;

import java.util.List;

@Service
@Slf4j
public class PjtServiceImpl implements PjtService {


    private final PjtDao projectDao;


    @Autowired
    public PjtServiceImpl(PjtDao projectDao) {
        this.projectDao = projectDao;
    }

    // 프로젝트 등록 처리
    @Override
    public void register(PjtVO pjtVO) throws Exception {


        String orgC = pjtVO.getPjtOrgC();
        String divC = pjtVO.getPjtDivC();
        String pjStC = pjtVO.getPjtStC();

        switch (orgC) {
            case "한국은행":
                pjtVO.setPjtOrgC("001");
                break;
            case "산업은행":
                pjtVO.setPjtOrgC("002");
                break;
            case "기업은행":
                pjtVO.setPjtOrgC("003");
                break;
            case "KB국민은행":
                pjtVO.setPjtOrgC("004");
                break;
            case "수협은행":
                pjtVO.setPjtOrgC("005");
                break;
        }

        switch (pjStC) {
            case "시작예정":
                pjtVO.setPjtStC("B00");
                break;
            case "기획":
                pjtVO.setPjtStC("B01");
                break;
            case "개발":
                pjtVO.setPjtStC("B02");
                break;
            case "테스트":
                pjtVO.setPjtStC("B03");
                break;
        }

        switch (divC) {
            case "ECM":
                pjtVO.setPjtDivC("A01");
                break;
            case "OCR":
                pjtVO.setPjtDivC("A02");
                break;
        }

        String settingPjtc = pjtVO.getPjtOrgC() + pjtVO.getPjtDivC();
        pjtVO.setPjtC(settingPjtc);


        log.info("프로젝트 코드 : " + pjtVO.getPjtC());

        projectDao.register(pjtVO);
    }

    // 프로젝트 조회(전체)
    @Override
    public List<PjtVO> pjtShow() throws Exception {
        return projectDao.pjtShow();
    }

    // 프로젝트 삭제
    @Override
    public void deletePjtCode(String no) {
        projectDao.deletePjtCode(no);
    }

    @Override
    public void deletePjt(String no) {
        projectDao.deletePjt(no);
    }

    //프로젝트 수정
    @Override
    public void pjtEdit(PjtVO pjtVO) throws Exception {
    	
        String orgC = pjtVO.getPjtOrgC();
        String divC = pjtVO.getPjtDivC();
        String pjStC = pjtVO.getPjtStC();

        switch (orgC) {
            case "한국은행":
                pjtVO.setPjtOrgC("001");
                break;
            case "산업은행":
                pjtVO.setPjtOrgC("002");
                break;
            case "기업은행":
                pjtVO.setPjtOrgC("003");
                break;
            case "KB국민은행":
                pjtVO.setPjtOrgC("004");
                break;
            case "수협은행":
                pjtVO.setPjtOrgC("005");
                break;
        }

        switch (pjStC) {
            case "시작예정":
                pjtVO.setPjtStC("B00");
                break;
            case "기획":
                pjtVO.setPjtStC("B01");
                break;
            case "개발":
                pjtVO.setPjtStC("B02");
                break;
            case "테스트":
                pjtVO.setPjtStC("B03");
                break;
        }

        switch (divC) {
            case "ECM":
                pjtVO.setPjtDivC("A01");
                break;
            case "OCR":
                pjtVO.setPjtDivC("A02");
                break;
        }
        
        projectDao.pjtEdit(pjtVO);
    }

    @Override
    public List<PjtVO> memberUnion() throws Exception {
        return projectDao.memberUnion();
    }
}
