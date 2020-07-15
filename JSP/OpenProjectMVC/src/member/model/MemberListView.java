package member.model;

import java.util.List;

//데이터 베이스 회원 정보 리스트
public class MemberListView {

	// 전체 회원 정보 개수
	private int memberTotalCount;

	// 전체 페이지의 개수
	private int pageTotalCount;

	// 페이지 당 표현 할 회원 정보 개수 - 상수
	private int memberCountPage;

	// 현재 페이지의 번호
	private int currentPageNumber;

	// 출력 할 멤버 리스트
	private List<Member> memberList;

	// 게시물의 시작 행
	private int startRow;

	public MemberListView(int memberTotalCount, int memberCountPage, int currentPageNumber, List<Member> memberList,
			int startRow) {
		super();
		this.memberTotalCount = memberTotalCount;
		this.memberCountPage = memberCountPage;
		this.currentPageNumber = currentPageNumber;
		this.memberList = memberList;
		this.startRow = startRow;
		calTotalCount();
	}

	// 전체 페이지를 구하는 메소드
	private void calTotalCount() {
		if (memberTotalCount == 0) {
			pageTotalCount = 0;
		} else {

			// 전체 페이지 수 = 전체 회원 정보 수 / 한 페이지 당 표현 할 회원 정보 수
			pageTotalCount = memberTotalCount / memberCountPage;
			// 전체 회원 정보 수 / 페이지 당 회원 정보 수의 나머지에 따라 페이지를 추가해준다.?
			if (memberTotalCount % memberCountPage > 0) {
				pageTotalCount++;
			}

		}
	}

	public int getMemberTotalCount() {
		return memberTotalCount;
	}

	public void setMemberTotalCount(int memberTotalCount) {
		this.memberTotalCount = memberTotalCount;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getMemberCountPage() {
		return memberCountPage;
	}

	public void setMemberCountPage(int memberCountPage) {
		this.memberCountPage = memberCountPage;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Member> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<Member> memberList) {
		this.memberList = memberList;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

}
