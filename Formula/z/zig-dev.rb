class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f4821e8a3b2d98a833788d4da7f7484c0d6a8dacb60dd3d53b895fbed916d056" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e402a1b56c120ffd3389da85be8805e94d76c92b26f237889560a42851c5f01c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "061d86ad21aa71b14a2e69ffc72b55cdf00b1e2b05e4df5c3d8fa9ff7b7960f3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3089+87bbb49d5.tar.xz"
  version "0.14.0-dev.3089+87bbb49d5"
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
