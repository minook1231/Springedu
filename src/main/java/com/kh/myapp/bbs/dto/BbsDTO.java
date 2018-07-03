package com.kh.myapp.bbs.dto;

import java.sql.Date;

import javax.persistence.Entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data // getter,setter,toString,equals,hashCode 자동생성
@NoArgsConstructor // 디폴트생성자
//@Slf4j // 로그 멤버변수 생성 log
public class BbsDTO {

	private int bnum; // 게시글번호
	private String btitle; // 제목
	private String bid; // 작성자ID
	private String bname; // 작성자이름
	private Date bcdate; // 작성일시
	private Date budate; // 수정일시
	private int bhit; // 조회수
	private String bcontent; // 글내용
	private int bgroup; // 답글그룹
	private int bstep; // 답변글의 단계
	private int bindent; // 답변글 들여쓰기
}
