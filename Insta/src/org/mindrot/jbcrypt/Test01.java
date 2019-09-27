package org.mindrot.jbcrypt;

public class Test01 {
	public static void main(String[] args) {
		//BCrypt는 비밀번호 암호화에 특화된 강력한 암호화 기법이라고 합니당
		
		String pw="abcd^1234^"; //회원가입->비번 생성
		// Hash a password for the first time
		// gensalt's log_rounds parameter determines the complexity
		// the work factor is 2**log_rounds, and the default is 10
		String hashed=BCrypt.hashpw(pw, BCrypt.gensalt(10)); //pw를 암호화, 2번째 인자의 숫자가 클수록 보안좋고 시간 더 걸림, 숫자 안넣으면 디폴트로 10
		System.out.println(pw+"->"+hashed);
		
		String candidate="abcd?1234^"; //로그인 시도1
		// Check that an unencrypted password matches one that has
		// previously been hashed
		System.out.print(candidate+" ");
		if (BCrypt.checkpw(candidate, hashed))
			System.out.println("It matches");
		else
			System.out.println("It does not match");

		String candidate2="abcd^1234^"; //로그인 시도2
		System.out.print(candidate2+" ");
		if (BCrypt.checkpw(candidate2, hashed))
			System.out.println("It matches");
		else
			System.out.println("It does not match");
	}
}
