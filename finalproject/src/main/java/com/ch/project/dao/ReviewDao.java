package com.ch.project.dao;

import java.util.List;

import com.ch.project.model.Review;

public interface ReviewDao {

	Review selectMovReview(String email, int movNum);

	Review selectTvReview(String email, int tvNum);

	int tvReviewRateInsert(String email, int reviewRate, int tvNum);

	int reviewRateUpdate(int reviewRate, int tvNum);

	int movReviewRateInsert(String email, int reviewRate, int movNum);

	// 리뷰 코멘트 등록, 수정 (스포 X)
	int writeCommentFirst(Review review);

	// 리뷰 코멘트 등록, 수정 (스포 O)
	int writeCommentSpoilerFirst(Review review);
	
	// 리뷰 코멘트 등록, 수정 (스포 X)
	int writeComment(Review review);
	
	// 리뷰 코멘트 등록, 수정 (스포 O)
	int writeCommentSpoiler(Review review);

	// 리뷰 코멘트 삭제
	int deleteComment(int reviewNum);

	List<Review> hashMoList(int hashNum);

	List<Review> hashTvList(int hashNum);

	List<Review> list(String email, int startRow, int endRow);

	List<Review> list2(String email, int startRow, int endRow);

	int total(String email);

	List<Review> movieReviewList(int movNum);
	
	List<Review> movieReviewList(int movNum, String email);

	List<Review> tvReviewList(int tvNum);
	
	List<Review> tvReviewList(int tvNum, String email);

	int tvUpdateNoSpoiler(Review review);

	int tvUpdateSpoiler(Review review);

	Review select(int reviewNum);

	int likeUp(int reviewNum);

	int likeDown(int reviewNum);

	Review select2(String email);

	int selectLikeChk(int reviewNum, String email);

	int countLikeChk(int reviewNum, String email);

	int pointUp(String email);

	int countMovie(String email);
	
	int countTv(String email);

	int preReviewCount(String email);

	List<Review> preGenre(String email);

	List<Review> everRateMovie(int movNum);

	int everRateCountMovie(int movNum);
	
	List<Review> everRateTv(int tvNum);

	int everRateCountTv(int tvNum);
	
	double rateAvg(String email);

	int rateCnt(String email);

	double mostRating(String email);

}
