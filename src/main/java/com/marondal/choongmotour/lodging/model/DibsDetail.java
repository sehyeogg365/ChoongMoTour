package com.marondal.choongmotour.lodging.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DibsDetail {// 찜 카드에 필요한 데이터들
	private int id; // 몇번째 찜했는지
	private int userId; // 누가 저장했는지
	private int lodgingId; // 어떤숙소인지
	private int roomId;
	private String roomName; // 숙소명
	private String areaName; // 지역
	private String imagePath; // 사진 등
	private boolean isDibs; // 이것도 가만생각해보니 넣어야 한다. 빨간하트일때 남아있고 빈하트일때 사라지게 끔
	// 가만생각해보니 roomId도 안넣었는데 어떻게 가격이 나오는가? 근데 생각해보면 싱글룸 가격을 넣는게 되게 복잡하니 넣지 말자.
	// 찜했냐 안했냐 여부 생각해보니 여긴 필요가없다. 그냥 빨간하트 한번 누르면 삭제되는 개념이라서 당연히 찜 누른게 여기 목록에있는거라서
}
