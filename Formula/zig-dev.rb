class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "59c946d5208cd32797c77e063a2377187ee3014422369cc928adb25c11bb8c3f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "79081a33f992108f056076207685a8f29086ff46f3e26870d93a98aa1145baff" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ba4b8fa8541926b8e8da7cb5ea52f219c0cc3f76b8373014228f8216bc6c5848" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4332+43b830415.tar.xz"
  version "0.11.0-dev.4332+43b830415"
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
