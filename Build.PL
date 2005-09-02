use strict;
use lib 'lib';
use lib '../lib';
use Catalyst::Build;

my $requires = {
  'Catalyst'                       => '5.10',
  'Catalyst::Plugin::Static'       => '0.07',
  'Catalyst::View::TT'             => '0.11',
  'HTML::Prototype'                => '0',
  'List::Util'                     => '0',
  'Path::Class'                    => '0',
  'PPI'                            => '1.003',
  'PPI::HTML'                      => '0',
  'PPI::Lexer'                     => '0',
  'Storable'                       => '0',
  'Template'                       => '0',
  'Test::More'                     => '0',
  'Devel::ebug'                    => '0.45',
  'Test::WWW::Mechanize::Catalyst' => '0.31',
};

# Test::Expect doesn't run under Windows atm
if ($^O !~ /mswin32/i) {
  $requires->{'Test::Expect'} = '0';
}

my $build = Catalyst::Build->new(
  create_makefile_pl => 'small',
  license            => 'perl',
  module_name        => 'Devel::ebug::HTTP',
  requires           => $requires,
  script_files       => ['ebug_http'],
);
$build->{config}->{__extras_from} = ['root'];
$build->create_build_script;
