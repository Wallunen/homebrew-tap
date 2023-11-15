class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "af5539b246bc74e8b2b3cca16f75a0064dcd229697dcd8166efa292ee1e3c6a0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c35854d523a2fc836cf5fe2e5737a8d6c3340839e82f6f1c4c89efee7f48e266" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "28536bbfaeab44f39aaf67f5e3d2664ed6e821dbc7b7f9345b8275f7a103c398" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1625+6fd1c64f2.tar.xz"
  version "0.12.0-dev.1625+6fd1c64f2"
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
