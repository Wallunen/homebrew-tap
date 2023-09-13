class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a137bbfd3112c278c27ebe157d80a7fe55185542fdd42b91f299c687afe23030" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "adbcc2eeae96143a3886b727a76a9e23182f5926c072cec63f6530b8b555778f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bfa52fc9c40777ae39b30b056cdef11715e5510ec7e3943d19b76ca54d6efa47" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.309+402468b21.tar.xz"
  version "0.12.0-dev.309+402468b21"
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
