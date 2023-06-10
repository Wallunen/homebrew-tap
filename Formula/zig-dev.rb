class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c4bd0cbc8c1a98562872dc481d71ace0cd779cdbb498bdcc846a3f79a0fe60cc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1b4623573850e2deb9f23a741588ea30af4b68ce3175c3de4f7776e32702a15b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3c4cf5d1fff683e01f2f2512a39184f5132526679a6ab63ea7b88916d343b738" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3386+99fe2a23c.tar.xz"
  version "0.11.0-dev.3386+99fe2a23c"
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
