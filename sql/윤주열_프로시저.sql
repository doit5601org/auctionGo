SELECT *
FROM TAB;


-- 경매 등록 프로시저
CREATE OR REPLACE PROCEDURE PRC_AUCTION_CREATE(
    P_USER_ID           IN NUMBER,              --회원 고유키
    P_PRODUCT_ID        IN NUMBER,              --상품코드
    P_AUCTION_TITLE     IN VARCHAR2,            --경매제목
    P_CONTENT           IN VARCHAR2,            --경매 글
    P_START_PRICE       IN NUMBER,              --시작가
    P_PERIOD_CODE       IN NUMBER               --경매기간
)
IS
    -- 에러 번호 변수 선언
    ERR_LACK_MONEY      CONSTANT NUMBER := -20004;
    ERR_UNKNOWN         CONSTANT NUMBER := -20009;

    V_CURRENT_MONEY     NUMBER := 0;
    V_AUCTION_ID        NUMBER;
BEGIN
    
    -- 해당 유저의 보증금 확인
    SELECT NVL(SUM(AMOUNT), 0) INTO v_current_money
    FROM MONEY_TRANSACTION_HISTORY
    WHERE USER_ID = P_USER_ID;

    -- 보증금 부족할 시 RAISE
    IF v_current_money < 30000 THEN
        RAISE_APPLICATION_ERROR(ERR_LACK_MONEY, '보증금이 부족합니다.');
    END IF;

    -- 경매 등록 테이블 INSERT
    INSERT INTO AUCTION_REGISTRATION (
        AUCTION_ID, PRODUCT_ID, AUCTION_TITLE, AUCTION_CONTENT, 
        START_PRICE, CREATED_AT, AUCTION_PERIOD_ID
    ) VALUES (
        AUCTION_SEQ.NEXTVAL, P_PRODUCT_ID, P_AUCTION_TITLE, 
        P_CONTENT, P_START_PRICE, SYSDATE, P_PERIOD_CODE
    ) RETURNING AUCTION_ID INTO V_AUCTION_ID;   -- 해당 AUCTION_ID를 바로 V변수에 담음
    

    -- 머니 차감 기록 INSERT
    INSERT INTO MONEY_TRANSACTION_HISTORY (
        MONEY_ID, USER_ID, MONEY_TYPE_ID, AUCTION_ID, AMOUNT, CREATED_AT
    ) VALUES (
        MONEY_TRANSACTION_SEQ.NEXTVAL, P_USER_ID, 2, V_AUCTION_ID, -30000, SYSDATE
    );
EXCEPTION        
    WHEN OTHERS THEN
        ROLLBACK;
        IF SQLCODE BETWEEN -20999 AND -20000 THEN
            RAISE; -- 이미 정의된 커스텀 에러는 그대로 통과
        ELSE
            RAISE_APPLICATION_ERROR(ERR_UNKNOWN, '예상치 못한 오류가 발생했습니다');
        END IF;
END;



