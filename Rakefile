task :default => :install

task :install => [:quicklisp, :rvm]

task :quicklisp do
  sh <<EOF
curl -O http://beta.quicklisp.org/quicklisp.lisp &&
sbcl --load quicklisp.lisp \
     --eval '(quicklisp-quickstart:install)' \
     --eval '(ql:add-to-init-file)' \
     --eval '(quit)'
EOF

end

task :gitflow do
  sh <<EOF
  wget --no-check-certificate -q -O - https://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh | sudo bash
EOF
end

task :rvm do
  sh <<EOF
  \curl -L https://get.rvm.io | bash -s stable
EOF
end
