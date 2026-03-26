[webservers]
%{ for idx, ip in instance_ips ~}
web-${idx} ansible_host=${ip}
%{ endfor ~}
