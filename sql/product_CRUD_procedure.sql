

--●상품 등록 프로시저

CREATE OR REPLACE PROCEDURE PRC_PRODUCT_CREATE
(
      P_USER_ID              IN PRODUCT.USER_ID%TYPE              -- 회원고유키 (NN)
    , P_PRODUCT_RELEASE_NAME IN PRODUCT.PRODUCT_RELEASE_NAME%TYPE -- 상품 발매명
    , P_PRODUCT_ALIAS        IN PRODUCT.PRODUCT_ALIAS%TYPE        -- 상품 별칭
    , P_MANUFACTURER_ID      IN PRODUCT.MANUFACTURER_ID%TYPE      -- 제조사 코드
    , P_PRODUCT_GRADE_ID     IN PRODUCT.PRODUCT_GRADE_ID%TYPE     -- 등급 코드 (NN)
    , P_PRODUCT_GENRE_ID     IN PRODUCT.PRODUCT_GENRE_ID%TYPE     -- 장르 코드 (NN)
    , P_PRODUCT_SIZE_ID      IN PRODUCT.PRODUCT_SIZE_ID%TYPE      -- 사이즈 코드 (NN)
    , P_WORK_NAME            IN PRODUCT.WORK_NAME%TYPE            -- 작품명
    , P_CHARACTER_NAME       IN PRODUCT.CHARACTER_NAME%TYPE       -- 캐릭터명
    , P_PURCHASE_DATETIME    IN PRODUCT.PURCHASE_DATETIME%TYPE    -- 구매일시
    , P_IS_OPENED            IN PRODUCT.IS_OPENED%TYPE            -- 개봉여부 (NN)
    , P_IS_PARTS_MISSING     IN PRODUCT.IS_PARTS_MISSING%TYPE     -- 파츠 누락 여부 (NN)
    , P_DESCRIPTIONS         IN PRODUCT.DESCRIPTIONS%TYPE         -- 상세설명
    , P_IMAGE_PATH_1         IN PRODUCT.IMAGE_PATH_1%TYPE         -- 이미지 1 (NN)
    , P_IMAGE_PATH_2         IN PRODUCT.IMAGE_PATH_2%TYPE         -- 이미지 2 (NN)
    , P_IMAGE_PATH_3         IN PRODUCT.IMAGE_PATH_3%TYPE         -- 이미지 3 (NN)
    , P_IS_PUBLIC            IN PRODUCT.IS_PUBLIC%TYPE            -- 공개 여부 (NN)
)
IS
    V_CNT NUMBER;
BEGIN
   
    -- 회원 정보 체크
    IF P_USER_ID IS NULL THEN
        RAISE_APPLICATION_ERROR(-20010, '회원 정보가 유효하지 않습니다.');
    END IF;

    -- 선택사항 체크
    IF P_PRODUCT_GRADE_ID IS NULL OR P_PRODUCT_GENRE_ID IS NULL OR P_PRODUCT_SIZE_ID IS NULL THEN
        RAISE_APPLICATION_ERROR(-20011, '상품 등급, 장르, 사이즈는 필수 선택 사항입니다.');
    END IF;

    -- 상태 및 공개 여부 체크
    IF P_IS_OPENED IS NULL OR P_IS_PARTS_MISSING IS NULL OR P_IS_PUBLIC IS NULL THEN
        RAISE_APPLICATION_ERROR(-20012, '개봉/누락/공개 여부를 모두 선택해주세요.');
    END IF;

    -- 이미지 3장 필수 체크
    IF P_IMAGE_PATH_1 IS NULL OR P_IMAGE_PATH_2 IS NULL OR P_IMAGE_PATH_3 IS NULL THEN
        RAISE_APPLICATION_ERROR(-20013, '상품 사진은 최소 3장이 필요합니다.');
    END IF;

    INSERT INTO PRODUCT 
    (
          PRODUCT_ID,           USER_ID,              PRODUCT_RELEASE_NAME
        , PRODUCT_ALIAS,        MANUFACTURER_ID,      PRODUCT_GRADE_ID
        , PRODUCT_GENRE_ID,     PRODUCT_SIZE_ID,      WORK_NAME
        , CHARACTER_NAME,       PURCHASE_DATETIME,    IS_OPENED
        , IS_PARTS_MISSING,     DESCRIPTIONS,         IMAGE_PATH_1
        , IMAGE_PATH_2,         IMAGE_PATH_3,         IS_PUBLIC
        , CREATED_AT
    ) VALUES 
    (
          PRODUCT_SEQ.NEXTVAL,  P_USER_ID,            P_PRODUCT_RELEASE_NAME
        , P_PRODUCT_ALIAS,      P_MANUFACTURER_ID,    P_PRODUCT_GRADE_ID
        , P_PRODUCT_GENRE_ID,   P_PRODUCT_SIZE_ID,    P_WORK_NAME
        , P_CHARACTER_NAME,     P_PURCHASE_DATETIME,  P_IS_OPENED
        , P_IS_PARTS_MISSING,   P_DESCRIPTIONS,       P_IMAGE_PATH_1
        , P_IMAGE_PATH_2,       P_IMAGE_PATH_3,       P_IS_PUBLIC
        , SYSDATE
    );
       
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20015, '상품등록이 실패하였습니다.');
    END IF;
    

    COMMIT;
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
--------------------------------------------------------------------------------

-- ●상품 수정 프로시저

CREATE OR REPLACE PROCEDURE PRC_PRODUCT_UPDATE
(
      P_PRODUCT_ID           IN PRODUCT.PRODUCT_ID%TYPE           -- 상품코드 (PK)
    , P_USER_ID              IN PRODUCT.USER_ID%TYPE              -- 본인 확인용
    , P_PRODUCT_RELEASE_NAME IN PRODUCT.PRODUCT_RELEASE_NAME%TYPE -- 상품 발매명
    , P_PRODUCT_ALIAS        IN PRODUCT.PRODUCT_ALIAS%TYPE        -- 상품 별칭
    , P_MANUFACTURER_ID      IN PRODUCT.MANUFACTURER_ID%TYPE      -- 제조사 코드
    , P_PRODUCT_GRADE_ID     IN PRODUCT.PRODUCT_GRADE_ID%TYPE     -- 등급 코드 (NN)
    , P_PRODUCT_GENRE_ID     IN PRODUCT.PRODUCT_GENRE_ID%TYPE     -- 장르 코드 (NN)
    , P_PRODUCT_SIZE_ID      IN PRODUCT.PRODUCT_SIZE_ID%TYPE      -- 사이즈 코드 (NN)
    , P_WORK_NAME            IN PRODUCT.WORK_NAME%TYPE            -- 작품명
    , P_CHARACTER_NAME       IN PRODUCT.CHARACTER_NAME%TYPE       -- 캐릭터명
    , P_PURCHASE_DATETIME    IN PRODUCT.PURCHASE_DATETIME%TYPE    -- 구매일시
    , P_IS_OPENED            IN PRODUCT.IS_OPENED%TYPE            -- 개봉여부 (NN)
    , P_IS_PARTS_MISSING     IN PRODUCT.IS_PARTS_MISSING%TYPE     -- 파츠 누락 여부 (NN)
    , P_DESCRIPTIONS         IN PRODUCT.DESCRIPTIONS%TYPE         -- 상세설명
    , P_IMAGE_PATH_1         IN PRODUCT.IMAGE_PATH_1%TYPE         -- 이미지 1 (NN)
    , P_IMAGE_PATH_2         IN PRODUCT.IMAGE_PATH_2%TYPE         -- 이미지 2 (NN)
    , P_IMAGE_PATH_3         IN PRODUCT.IMAGE_PATH_3%TYPE         -- 이미지 3 (NN)
    , P_IS_PUBLIC            IN PRODUCT.IS_PUBLIC%TYPE            -- 공개 여부 (NN)
)
IS
    V_CNT NUMBER;
BEGIN
   
    -- 상품 정보 체크
    IF P_PRODUCT_ID IS NULL OR P_USER_ID IS NULL THEN
        RAISE_APPLICATION_ERROR(-20023, 'ERR_ID_REQUIRED');
    END IF;


    -- 선택사항 체크
    IF P_PRODUCT_GRADE_ID IS NULL OR P_PRODUCT_GENRE_ID IS NULL OR P_PRODUCT_SIZE_ID IS NULL THEN
        RAISE_APPLICATION_ERROR(-20011, '상품의 등급, 장르, 사이즈 정보는 필수입니다.');
    END IF;
    
    -- 상태 및 공개 여부 체크
    IF P_IS_OPENED IS NULL OR P_IS_PARTS_MISSING IS NULL OR P_IS_PUBLIC IS NULL THEN
        RAISE_APPLICATION_ERROR(-20012, '개봉 여부, 파츠 누락 여부, 공개 설정은 필수 선택 사항입니다.');
    END IF;
    
    -- 이미지 3장 필수 체크
    IF P_IMAGE_PATH_1 IS NULL OR P_IMAGE_PATH_2 IS NULL OR P_IMAGE_PATH_3 IS NULL THEN
        RAISE_APPLICATION_ERROR(-20013, '이미지 3장은 필수 항목입니다.');
    END IF;

    -- 상품 존재 및 본인 소유 여부 확인
    SELECT COUNT(*) INTO V_CNT
    FROM PRODUCT
    WHERE PRODUCT_ID = P_PRODUCT_ID AND USER_ID = P_USER_ID;

    IF V_CNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20021, '해당 상품이 없거나 수정 권한이 없습니다.');
    END IF;

    UPDATE PRODUCT
    SET PRODUCT_RELEASE_NAME = P_PRODUCT_RELEASE_NAME, PRODUCT_ALIAS = P_PRODUCT_ALIAS,   MANUFACTURER_ID    = P_MANUFACTURER_ID
     , PRODUCT_GRADE_ID     = P_PRODUCT_GRADE_ID,    PRODUCT_GENRE_ID = P_PRODUCT_GENRE_ID, PRODUCT_SIZE_ID  = P_PRODUCT_SIZE_ID
     , WORK_NAME            = P_WORK_NAME,           CHARACTER_NAME   = P_CHARACTER_NAME,   PURCHASE_DATETIME= P_PURCHASE_DATETIME
     , IS_OPENED            = P_IS_OPENED,           IS_PARTS_MISSING = P_IS_PARTS_MISSING, DESCRIPTIONS     = P_DESCRIPTIONS
     , IMAGE_PATH_1         = P_IMAGE_PATH_1,        IMAGE_PATH_2     = P_IMAGE_PATH_2,     IMAGE_PATH_3     = P_IMAGE_PATH_3
     , IS_PUBLIC            = P_IS_PUBLIC
    WHERE PRODUCT_ID = P_PRODUCT_ID;
    
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20022, '수정 대상이 존재하지 않습니다.');
    END IF;

    COMMIT;
    
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
--------------------------------------------------------------------------------

--●상품 삭제 프로시저

CREATE OR REPLACE PROCEDURE PRC_PRODUCT_DELETE
(
      P_PRODUCT_ID IN PRODUCT.PRODUCT_ID%TYPE 
    , P_USER_ID    IN PRODUCT.USER_ID%TYPE  
)
IS
    V_CNT NUMBER;
BEGIN
    -- 파라미터 체크
    IF P_PRODUCT_ID IS NULL THEN
        RAISE_APPLICATION_ERROR(-20023, '삭제할 상품 번호가 입력되지 않았습니다.');
    END IF;
    
    IF P_USER_ID IS NULL THEN
        RAISE_APPLICATION_ERROR(-20010, '회원 정보가 유효하지 않습니다.');
    END IF;

    -- 상품 존재 및 본인 여부 확인
    SELECT COUNT(*) INTO V_CNT
    FROM PRODUCT
    WHERE PRODUCT_ID = P_PRODUCT_ID AND USER_ID = P_USER_ID;

    IF V_CNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20024, '삭제 권한이 없거나 이미 존재하지 않는 상품입니다.');
    END IF;

    -- 진행 중인 경매 여부 확인 (함수 FN_IS_AUCTION_FINISHED 활용)
    -- 해당 상품으로 등록된 경매들 중, 함수 결과 0 = 경매중
    SELECT COUNT(*) INTO V_CNT
    FROM AUCTION_REGISTRATION
    WHERE PRODUCT_ID = P_PRODUCT_ID
      AND FN_IS_AUCTION_FINISHED(AUCTION_ID) = 0; 

    IF V_CNT > 0 THEN
        RAISE_APPLICATION_ERROR(-20016, '진행 중인 경매가 존재합니다.');
    END IF;

    -- 이미지 테이블 삭제
    DELETE FROM PRODUCT_IMAGE
    WHERE PRODUCT_ID = P_PRODUCT_ID;
    
    -- 상품 삭제
    DELETE FROM PRODUCT
    WHERE PRODUCT_ID = P_PRODUCT_ID;
    
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20025, '삭제 대상이 존재하지 않습니다.');
    END IF;

    COMMIT;
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;



