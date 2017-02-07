require 'spec_helper'

describe 'goss' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "goss class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('goss::params') }
          it { is_expected.to contain_class('goss::install').that_comes_before('goss::config') }
          it { is_expected.to contain_class('goss::config') }
          it { is_expected.to contain_class('goss::service').that_subscribes_to('goss::config') }

          it { is_expected.to contain_service('goss') }
          it { is_expected.to contain_package('goss').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'goss class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('goss') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
