class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f9e98df8627091388533e613dcc06040dc8a73cec8a75cea01dc5a18d45174f1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a28fdc65246d9f918df95b12992cd3d3ee79ea5cdc82913d70dfc2c8ba5e4276" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "425b2a90cefe847ff6b0a81a8e2d5cacb19f9edc7263cd91d30aa5311befb4ae" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3101+6c41d4351.tar.xz"
  version "0.11.0-dev.3101+6c41d4351"
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
