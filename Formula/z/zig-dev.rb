class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1ad963f012bd4ee6765c5e7da91dc8f373c08656873ff7374d1f7c180eda5b01" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b46325f3a3ce13f77e682e80f2e17e501fa25bbe012bab7e3e9877f7209c9973" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "82a2a276a47b9ac442c78a9da9dd4d895c7d8cb24a31819f42702850182a46f1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.211+0cc42d090.tar.xz"
  version "0.14.0-dev.211+0cc42d090"
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
