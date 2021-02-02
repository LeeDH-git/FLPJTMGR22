package org.leedh.project.vo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PjtVO {

/*
    프로젝트코드			pjtC;
    기관종류				pjtOrgC;
    프로젝트종류			pjtDivC;
    프로젝트상태코드			pjtStC;
	고객명				pjtClient;
	프로젝트명				pjtNM;
	프로젝트 투입인력		pjtEmpList
	PM					pjtPM;
	프로젝트시작일 			pjtStartDate;
	프로젝트종료일 			pjtEndDate;
	프로젝트종료여부			pjtEndYn
*/
	
	private String pjtC;
	private String pjtOrgC;
	private String pjtDivC;
	private String pjtStC;
	private String pjtClient;
	private String pjtNm;
	private String pjtEmpList;
	private String pjtPm;
	private String pjtStartDate;
	private String pjtEndDate;
	private String pjtEndYn;
	
}
