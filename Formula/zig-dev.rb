class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0714abde31c4f22f1128d72df624011b0a01e8077ea5506a299c3a6de51c8a69" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "87e5aecf3844e1058f86d5430f23edb2ec190848a9fb969aa84bbeb80249aeb1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "26775e5e918af48d3ccb149da5c98928fb13d2aff39ca3cac978bdea2e3c0d15" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3970+7a8002a5c.tar.xz"
  version "0.11.0-dev.3970+7a8002a5c"
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
