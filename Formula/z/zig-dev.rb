class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6762b34895f4b9ceb94b4acb060d76a6d553239239a4dd6fa5ce8f970d63620a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4ab83d81ed7575264efd7b84295acbf5580e92f248d4c6234022431d482d1b8d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9ebdbd1d14b8348e4e0c7dfc0fc591fdbb8629f301fd9360b4e9828c42e36723" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.137+e4447c54e.tar.xz"
  version "0.14.0-dev.137+e4447c54e"
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
