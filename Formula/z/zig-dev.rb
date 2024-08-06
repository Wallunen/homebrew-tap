class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a3e3b0f0e4e04fb840dc88da9650ddf46627fa81039b0526bcd28846b488c7e3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5dd94fdb86a16fda35a85a4ae22396655ea3f90060f30ec2166475543683fb6f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "31f4519e80caadb5dd6fa9f5b5dc0057d6413596eb75e60c7d4de6a4337684bf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.842+a655c15c4.tar.xz"
  version "0.14.0-dev.842+a655c15c4"
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
