package kr.or.ddit.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;

@Slf4j
public class CustomNoOpPasswordEncoder implements PasswordEncoder {

    // 비밀번호를 받아서 인코딩 해주는 메소드
    @Override
    public String encode(CharSequence charSequence) {
        // but 아무것도 안 하기로 함
        log.warn("before encode : {}", charSequence);
        return charSequence.toString();
    }

    @Override
    public boolean matches(CharSequence charSequence, String s) {
        log.warn("matches : {} : {}", charSequence, s);
        // 일치하면 true 리턴, 불일치하면 false 리턴
        return charSequence.toString().equals(s);
    }
}
