class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2f7880062c0e33564a2260d1fbe7687e6124354de8ce0796a2e62b16cb5a96a3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4fa77c010c536b797049ae567fa458d89f54bb699cbf0723f7fa1df633cb5e48" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b073b88f61a99df1bb53cfcdaa8303de1faa8d49cecb25ae5ab0e37bf564e206" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3686+3adfaf91f.tar.xz"
  version "0.12.0-dev.3686+3adfaf91f"
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
