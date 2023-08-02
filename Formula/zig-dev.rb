class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "aedeceb69362e48fdd8ca9c68f928798bf2b0ac07a25cd9fae701f79b17de647" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "53484a1703b0d08a1dc771494a4522ade89f445829c0133bf3b01b992f9c2b15" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "997f7d9747e3d46c31b3d6e54e4263810c67c8f1a77a8d9e4279af8535b39f84" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4404+4f6013bf5.tar.xz"
  version "0.11.0-dev.4404+4f6013bf5"
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
