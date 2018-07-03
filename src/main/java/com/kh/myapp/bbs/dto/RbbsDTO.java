package com.kh.myapp.bbs.dto;

import java.sql.Date;

import javax.persistence.Entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data // getter,setter,toString,equals,hashCode 자동생성
@NoArgsConstructor // 디폴트생성자
//@Slf4j // 로그 멤버변수 생성 log
public class RbbsDTO {

	private int rnum;   				// 댓글번호
	private int bnum;						// 원글번호
	private String rid;					// 작성자id
	private String rname;				// 작성자이름
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date rcdate;				// 작성일시
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date rudate;				// 수정일시
	private String rcontent;		// 글내용
	private int rgood;					// 좋아요
	private int rbad;						// 별로~
	private int rgroup;					// 댓글그룹
	private int rstep;					// 댓글의 단계
	private int rindent;				// 댓글 들여쓰기
}




