class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ad53843275fb67a13841b4ed79df76aca0551934133704bd78e4c3a8308f8d5e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ff1a8318de22c92d8e4123eba38e4bb4031746b21cb450cace8afec303ced1ab" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "434091ccb6380246edb101544e838a4394537897464b2412f5bbb4218e4d849d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3199+4162f401c.tar.xz"
  version "0.14.0-dev.3199+4162f401c"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
