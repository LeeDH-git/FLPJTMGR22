package org.leedh.user.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class EmpAdminVO {
    private int no;
    private int empNo;
    private LocalDateTime loginDate;
    private LocalDateTime joinDate;
    private LocalDateTime usChangePwDate;
    private int loginFailCount;
    private LocalDateTime listAccessDate;
    private String pjtDutyC;
    private String pjtJgC;
    private String pjtDeptC;

}
