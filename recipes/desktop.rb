
# Install Google Chrome
#
if platform?("redhat","fedora","centos") then
    cookbook_file "google-chrome.repo" do
        path "/etc/yum.repos.d/google-chrome.repo"
        action :create
    end

    package "google-chrome-stable"
end
