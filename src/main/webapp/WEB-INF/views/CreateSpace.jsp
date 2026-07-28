<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jira Create Space Page</title>
<script>
	document.addEventListener('DOMContentLoaded', () => {
		const emailInput = document.getElementById('emailInput');
		
		emailInput.addEventListener('input', (e) => {
			var searchEmail = e.target.value;
			// console.log(searchEmail);
			
		});
	});
</script>
<style>
	html, body {
		margin: 0;
		padding: 0;
		height: 100vh;
	}
	
	body {
		display: flex;
		flex-direction: row-reverse;
	}
	
	#container {
		width: 50%;
		height: 100vh;
		position: relative;
		overflow: hidden;
		margin: 30px 40px;
	}
	
	.main-title {
		font-size: 28px;
		font-weight: 653;
	}
	
	.header-subtitle {
		color: rgb(107, 110, 118);
		font-size: 14px;
		font-weight: 400;
	}
	
	.necessary {
		color: rgb(174, 46, 36);
		font-size: 12px;
		font-weight: 653;
		margin-left: -6px;
		display: inline-block;
		transform: translateY(-2px);
	}
	
	.title {
		color: rgb(80, 82, 88);
		font-size: 12px;
		font-weight: 653;
	}
	
	#email-input {
		border: 1px solid rgba(11, 18, 14, 0.19);
		padding: 5px;
		border-radius: 3px;
		width: 70%;
		max-width: 478px;
		height: 36px;
	}
	
	#email-input>input {
		border: none;
		outline: none;
		font-size: 14px;
		width: 70%;
		max-width: 478px;
	}
	
	#user-roll {
		padding: 5px;
		width: 70%;
		max-width: 478px;
		height: 36px;
		border: 1px solid rgba(11, 18, 14, 0.19);
		border-radius: 3px;
	}
	
	#button-container {
		border-top: 1px solid #ccc;
		padding: 10px;
		position: absolute;
		width: 100%;
		bottom: 0px;
		right: 20px;
		display: flex;
		gap: 10px;
		justify-content: flex-end;
	}
	
	#title-container>input {
		width: 70%;
		max-width: 478px;
		height: 36px;
		border: 1px solid rgba(11, 18, 14, 0.19);
		border-radius: 3px;
	}
	
	#key-container>input {
		width: 70%;
		max-width: 211px;
		height: 36px;
		border: 1px solid rgba(11, 18, 14, 0.19);
		border-radius: 3px;
	}
	
	#input-container {
		display: flex;
		flex-direction: column;
		gap: 24px;
	}
	
	input:focus {
		border-color: rgb(70, 136, 236);
		border-radius: 3px;
		outline: none;
	}
	
	#button-container>input {
		background-color: rgb(24, 104, 219);
		color: white;
		border: none;
		border-radius: 3px;
		font-size: 14px;
		padding: 6px;
	}
	
	#button-container {
		column-gap: 14px;
	}
	
	#preview {
		height: 100vh;
		width: 50%;
		flex-shrink: 0;
	}
</style>
</head>
<body>
	<div id="preview">
		<div class="css-19qpwdr"><div class="css-1dmg9dt"><svg width="100%" height="100%" viewBox="0 0 801 902" fill="none" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" class="_1e0c1ule _1bsb1osq _4t3i1osq"><g clip-path="url(#clip0_bg_img)"><path d="M1053.19 444.632L937.719 380.135C929.302 392.864 920.424 405.486 911.065 417.983C882.382 456.312 849.36 493.609 812.039 529.537C773.092 567.012 732.651 599.989 691.139 628.54C586.907 700.183 475.55 743.151 362.753 754.528C354.318 792.465 341.25 827.683 323.659 859.611C302.359 898.259 274.432 932.054 240.229 960H952.928L1053.19 902.419V444.632Z" fill="var(--ds-background-accent-blue-subtlest, #E9F2FE)"></path><path d="M355.998 58.8617C356.977 58.1861 357.955 57.4928 358.952 56.8173L257.488 0.125H0.0180664V185.597C121.914 179.891 242.962 136.549 355.998 58.8617Z" fill="var(--ds-background-accent-blue-subtlest, #E9F2FE)"></path><path d="M355.076 746.298C355.353 744.947 355.648 743.596 355.925 742.245C356.294 740.396 356.608 738.547 356.959 736.68C357.217 735.329 357.475 733.978 357.715 732.609C358.066 730.547 358.398 728.467 358.731 726.387C358.915 725.214 359.118 724.058 359.303 722.867C359.801 719.596 360.263 716.325 360.687 713.019C363.493 691.526 364.932 669.286 364.932 646.335C364.932 638.638 364.766 630.851 364.434 622.994C363.179 593.039 359.598 564.346 353.821 537.111C336.858 457.148 300.809 389.771 247.632 339.514C194.455 289.275 124.111 256.049 38.0234 244.672C25.675 243.036 12.9944 241.881 0 241.152V667.348C98.3256 722.281 200.38 748.68 302.157 748.68C319.803 748.68 337.449 747.862 355.057 746.28L355.076 746.298Z" fill="var(--ds-background-accent-blue-subtlest, #E9F2FE)"></path><path d="M254.11 333.168C308.764 384.811 345.607 453.912 362.865 535.333C368.753 563.065 372.389 592.22 373.663 622.638C373.995 630.62 374.161 638.513 374.161 646.335C374.161 669.641 372.684 692.254 369.842 714.12C369.399 717.48 368.937 720.84 368.421 724.165C368.273 725.178 368.088 726.173 367.922 727.187C367.553 729.498 367.202 731.791 366.796 734.084C366.575 735.364 366.316 736.609 366.095 737.889C365.726 739.898 365.375 741.907 364.969 743.898C364.877 744.395 364.766 744.875 364.674 745.373C474.738 733.729 583.53 691.561 685.768 621.287C726.856 593.038 766.91 560.381 805.505 523.244C842.495 487.636 875.202 450.712 903.572 412.793C912.746 400.526 921.458 388.135 929.727 375.673L367.682 61.6881C365.578 63.1636 363.474 64.6392 361.37 66.0969C246.986 144.709 124.056 188.779 0.0180664 194.486V232.245C13.4185 232.974 26.5237 234.165 39.2966 235.854C127.101 247.445 199.475 281.524 254.11 333.168Z" fill="var(--ds-background-accent-blue-subtlest, #E9F2FE)"></path><path d="M432.377 0.125H275.891L367.11 51.0761C389.204 35.3961 410.984 18.4006 432.377 0.125Z" fill="var(--ds-background-accent-blue-subtlest, #E9F2FE)"></path><path d="M934.656 368.135C1001.58 264.422 1036.53 154.433 1036.53 43.9282C1036.53 29.3329 1035.88 14.7376 1034.66 0.142334H446.203C423.167 20.2486 399.67 38.8438 375.785 55.9457L934.656 368.135Z" fill="var(--ds-background-accent-blue-subtlest, #E9F2FE)"></path><path d="M315.52 855.433C332.261 825.051 344.831 791.541 353.1 755.417C336.156 756.857 319.174 757.586 302.193 757.586C200.36 757.586 98.214 731.56 0.0361328 677.623V959.982H225.703C262.933 931.538 293.001 896.321 315.538 855.433H315.52Z" fill="var(--ds-background-accent-blue-subtlest, #E9F2FE)"></path><path d="M369.823 52.6044L375.785 55.9289C399.67 38.8089 423.168 20.2133 446.204 0.124444C446.259 0.0888889 446.296 0.0355556 446.351 0H432.526C432.526 0 432.434 0.0888889 432.379 0.124444C410.985 18.4 389.204 35.3956 367.11 51.0756L369.842 52.6044H369.823Z" fill="var(--ds-background-accent-blue-subtle, #669DF1)"></path><path d="M355.076 746.297C355.353 744.945 355.648 743.594 355.925 742.243C355.667 743.594 355.353 744.945 355.076 746.297Z" fill="var(--ds-background-accent-blue-subtle, #669DF1)"></path><path d="M364.988 743.898C365.376 741.907 365.745 739.898 366.114 737.889C365.745 739.898 365.394 741.907 364.988 743.898Z" fill="var(--ds-background-accent-blue-subtle, #669DF1)"></path><path d="M358.73 726.387C358.914 725.213 359.117 724.058 359.302 722.867C359.117 724.04 358.914 725.213 358.73 726.387Z" fill="var(--ds-background-accent-blue-subtle, #669DF1)"></path><path d="M323.66 859.593C341.25 827.664 354.319 792.43 362.754 754.51C359.542 754.83 356.312 755.132 353.082 755.417C344.813 791.558 332.243 825.069 315.501 855.433C292.964 896.321 262.896 931.538 225.667 959.982H240.211C274.414 932.036 302.359 898.241 323.641 859.593H323.66Z" fill="var(--ds-background-accent-blue-subtle, #669DF1)"></path><path d="M368.42 724.165C368.919 720.84 369.398 717.48 369.841 714.12C369.398 717.48 368.937 720.84 368.42 724.165Z" fill="var(--ds-background-accent-blue-subtle, #669DF1)"></path><path d="M367.682 61.6881L358.952 56.7993C357.973 57.4749 356.995 58.1682 355.998 58.8437C242.962 136.549 121.914 179.89 0.0180664 185.597V194.486C124.056 188.779 246.986 144.709 361.351 66.0791C363.455 64.6214 365.56 63.1459 367.664 61.6703L367.682 61.6881Z" fill="var(--ds-background-accent-blue-bolder, #1868DB)"></path><path d="M353.1 755.399C356.33 755.132 359.542 754.812 362.772 754.492C475.587 743.115 586.926 700.164 691.158 628.504C732.688 599.971 773.111 566.994 812.057 529.501C849.379 493.573 882.419 456.276 911.084 417.947C920.443 405.432 929.321 392.81 937.738 380.099L929.745 375.637C921.495 388.099 912.782 400.49 903.59 412.756C875.221 450.676 842.513 487.599 805.523 523.208C766.928 560.363 726.874 593.02 685.786 621.25C583.548 691.525 474.738 733.693 364.692 745.337C364.12 748.164 363.547 750.972 362.938 753.781L353.912 751.932C354.318 750.048 354.706 748.146 355.094 746.261C337.485 747.844 319.839 748.661 302.193 748.661C200.416 748.661 98.3432 722.262 0.0361328 667.329V677.587C98.2325 731.506 200.36 757.55 302.193 757.55C319.174 757.55 336.156 756.821 353.1 755.381V755.399Z" fill="var(--ds-background-accent-blue-bolder, #1868DB)"></path><path d="M247.65 339.513C300.827 389.77 336.876 457.146 353.838 537.109C359.616 564.344 363.197 593.037 364.452 622.992C364.784 630.85 364.95 638.636 364.95 646.334C364.95 669.267 363.51 691.524 360.705 713.017C360.28 716.324 359.819 719.613 359.32 722.866C359.136 724.039 358.933 725.212 358.748 726.386C358.416 728.466 358.084 730.546 357.733 732.608C357.493 733.977 357.235 735.328 356.976 736.679C356.644 738.528 356.312 740.394 355.943 742.243C355.684 743.594 355.37 744.945 355.094 746.296C354.706 748.199 354.318 750.083 353.912 751.967L362.938 753.816C363.547 751.025 364.138 748.199 364.692 745.372C364.784 744.874 364.895 744.394 364.987 743.897C365.375 741.905 365.744 739.897 366.113 737.888C366.353 736.626 366.593 735.363 366.814 734.083C367.22 731.79 367.571 729.497 367.94 727.186C368.106 726.172 368.273 725.177 368.439 724.164C368.937 720.839 369.417 717.479 369.86 714.119C372.721 692.253 374.179 669.64 374.179 646.334C374.179 638.512 374.013 630.619 373.681 622.637C372.407 592.219 368.771 563.064 362.883 535.332C345.625 453.929 308.764 384.81 254.128 333.166C199.493 281.523 127.119 247.444 39.3147 235.853C26.5602 234.164 13.4551 232.973 0.0361328 232.244V241.15C13.0305 241.861 25.7112 243.035 38.0595 244.67C124.129 256.066 194.491 289.274 247.668 339.513H247.65Z" fill="var(--ds-background-accent-blue-subtler, #CFE1FD)"></path><path d="M367.683 61.6877L929.746 375.655L937.738 380.117L1053.19 444.632L1062.42 449.787L1457.31 670.37L1062.42 897.103L1053.19 902.401L952.929 959.982H970.944L1053.19 912.765L1062.42 907.45L1475.53 670.263L1062.42 439.512L1053.19 434.356L942.648 372.598L934.656 368.135L375.786 55.9456L369.824 52.6035L275.651 0H257.249L257.489 0.124442L358.934 56.7989L367.683 61.6877Z" fill="var(--ds-background-accent-blue-subtler, #CFE1FD)"></path></g><defs><clipPath id="clip0_bg_img"><rect width="1772" height="960" fill="white"></rect></clipPath></defs></svg></div><div class="css-17wvonl"><div class="css-p7kkc6"><div class="css-e603f9"><div class="_1reo15vq _18m915vq _1bsb1osq _4t3i1osq _1e0c1txw _1bah1h6o _4cvr1h6o _lcxv1wug"><svg width="100%" height="100%" viewBox="0 0 960 720" fill="none" xmlns="http://www.w3.org/2000/svg" class="_p12f1osq _c71l1osq _lcxvglyw"></svg></div></div></div></div></div>
	</div>
	<div id="container">
		<header>
			<div id="header-container">
				<h1 class="main-title">스페이스 이름 지정</h1>
				<span class="header-subtitle">필수 필드는 별표로 표시되어 있습니다</span> <span
					class="necessary">＊</span>
			</div>
		</header>
		<main>
			<div id="input-container">
				<form id="createSpaceForm" action="<c:url value='/space/create'/>"
					method="post">
					<div id="title-container">
						<span class="title">이름</span> <span class="necessary">＊</span><br/>
						<input type="text" name="spaceTitle"
							placeholder="팀 이름, 프로젝트 목표, 마일스톤 등을 사용해보기">
					</div>
					<div id="key-container">
						<span class="title">키</span> <span class="necessary">＊</span><br/>
						<input type="text" name="spaceKey">
					</div>
				</form>
				<div id="invite-users">
					<span class="main-title">팀 초대하기</span><br/> 
					<span class="header-subtitle">Jira에서 이미 함께 공동 작업한 사용자를 추가하거나 새로운 사용자를 초대하세요.</span>
					<br/> 
					<a class="title">이름 또는 이메일 입력</a>
					<div id="email-input">
						<input type="text" id="emailInput" name="emailInput" placeholder="이메일을 입력하세요">
					</div>
				</div>
				<div id="user-roll-container">
					<a class="title">역할</a><br/> <select id="user-roll">
						<option value="admin" selected>관리자</option>
						<option value="editor">편집자</option>
						<option value="viewer">조회자</option>
					</select>
				</div>
			</div>
		</main>
		<footer>
			<div id="button-container">
				<input type="reset" id="cancle-button" value="이전"
					form="createSpaceForm"> <input type="submit"
					id="submit-button" value="제출" form="createSpaceForm">
			</div>
		</footer>
	</div>
</body>
</html>