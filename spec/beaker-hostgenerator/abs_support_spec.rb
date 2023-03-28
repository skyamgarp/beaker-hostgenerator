require 'beaker-hostgenerator/cli'
require 'json'

module BeakerHostGenerator
  describe AbsSupport do
    describe 'extract_templates' do
      it 'Returns a JSON map with template counts' do
        input = ['aix71-POWER-aix72-POWER-redhat7-POWER-sles12-POWER-solaris10-SPARC-solaris11-SPARC-centos7-64',
                 '--templates-only',
                 '--hypervisor', 'abs',]
        expect(JSON.load(BeakerHostGenerator::CLI.new(input).execute)).
          to eq({
                  'aix-7.1-power' => 1,
                  'aix-7.2-power' => 1,
                  'redhat-7.3-power8' => 1,
                  'sles-12-power8' => 1,
                  'solaris-10-sparc' => 1,
                  'solaris-11-sparc' => 1,
                  'centos-7-x86_64' => 1,
                })
      end
    end
  end
end
