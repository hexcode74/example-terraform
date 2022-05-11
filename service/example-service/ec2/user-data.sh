#!/bin/sh
init_yum_package() {
    echo ">>> init_yum_package"
    # date
    rm /etc/localtime
    ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

    # Install package awslogs cli jq telnet
    yum install -y awslogs jq aws-cli telnet wget util-linux-user
}

init_security_inspection() {
echo ">>> init_security_inspection"
#### add /etc/ssh/sshd_config
cat >> /etc/ssh/sshd_config <<- EOF
PermitRootLogin yes

# Root password Authentication yes
PasswordAuthentication yes

# default kerberos allow
RSAAuthentication yes
PubkeyAuthentication yes

# default kerberos allow
GSSAPIAuthentication yes
AllowTcpForwarding no
EOF

#### add /etc/sudoers
cat >> /etc/sudoers <<- EOF
deploy  ALL=NOPASSWD: ALL, !/bin/su, !/sbin/reboot, !/usr/bin/reboot, !/sbin/shutdown, !/sbin/halt, !/usr/bin/halt, !/sbin/poweroff, !/usr/bin/poweroff, !/sbin/init, !/usr/sbin/adduser, !/usr/sbin/useradd, !/usr/sbin/userdel, !/sbin/iptables, !/usr/bin/passwd
EOF

#####################################

#### 불필요한 사용자계정
#sudo chsh ec2-user -s /sbin/nologin
sudo systemctl restart sshd

#### 패스워드 복잡성 설정
SECURITY_FILE1="/etc/login.defs"
SECURITY_PATTERN1_OLD="PASS_MIN_LEN	5"
SECURITY_PATTERN1_NEW="PASS_MIN_LEN	12"
if sudo grep "$SECURITY_PATTERN1_OLD" $SECURITY_FILE1 > /dev/null
then
    sudo sed -i "s/$SECURITY_PATTERN1_OLD/$SECURITY_PATTERN1_NEW/g" $SECURITY_FILE1
fi

#### 패스워드 최소 사용기간 설정 미흡
SECURITY_PATTERN2_OLD="PASS_MIN_DAYS	0"
SECURITY_PATTERN2_NEW="PASS_MIN_DAYS	1"
if sudo grep "$SECURITY_PATTERN2_OLD" $SECURITY_FILE1 > /dev/null
then
    sudo sed -i "s/$SECURITY_PATTERN2_OLD/$SECURITY_PATTERN2_NEW/g" $SECURITY_FILE1
fi

#### Sendmail 서비스 배너 정보 노출 및 일반사용자 제한설정 미흡
SECURITY_FILE3="/etc/mail/sendmail.cf"
if sudo grep "O SmtpGreetingMessage=\$j" $SECURITY_FILE3 > /dev/null
then
    sudo sed -i "/O SmtpGreetingMessage=\$j/i\O SmtpGreetingMessage=Sendmail" $SECURITY_FILE3
    sudo sed -i "/O SmtpGreetingMessage=\$j/d" $SECURITY_FILE3
fi

SECURITY_PATTERN4_OLD="O PrivacyOptions=authwarnings,novrfy,noexpn,restrictqrun"
SECURITY_PATTERN4_NEW="O PrivacyOptions=authwarnings,novrfy,noexpn,restrictqrun,restrictmailq"
if sudo grep "$SECURITY_PATTERN4_OLD" $SECURITY_FILE3 > /dev/null
then
    sudo sed -i "s/$SECURITY_PATTERN4_OLD/$SECURITY_PATTERN4_NEW/g" $SECURITY_FILE3
fi

}

init_user() {
echo ">>> init_user"

# ec2-user gid change
sudo groupmod -g 500 ec2-user
sudo usermod -u 500 ec2-user

# deploy useradd
groupadd -g 1000 deploy
adduser deploy -g deploy -u 1000
## ec2-user groups add
sudo usermod -aG ec2-user,wheel,docker deploy

}

init_user

init_yum_package

init_security_inspection

#change_user

